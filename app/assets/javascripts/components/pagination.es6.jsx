class Pagination extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            paginationButtons: [],
            currentPage: this.props.data.currentPage,
            totalPages: this.props.data.totalPages
        };
        this.choosePage = this.choosePage.bind(this);
    }

    choosePage(event, item) {
        event.preventDefault();
        if (this.state.currentPage != item) {
            this.props.setCurrentPage(item);
        }
    }

    componentWillReceiveProps(nextProps) {
        this.setState({
            currentPage: nextProps.data.currentPage,
            paginationButtons: [
                1,
                (nextProps.data.currentPage - 1) > 0 ? nextProps.data.currentPage - 1 : false,
                nextProps.data.currentPage,
                nextProps.data.currentPage + 1 <= nextProps.data.totalPages ? nextProps.data.currentPage + 1 : false,
                nextProps.data.totalPages].filter(Boolean).map((item, index) => {
                return (
                    <li key={index} className={item == nextProps.data.currentPage ? 'disabled' : null}>
                        {/*<a onClick={() => this.props.setCurrentPage(item)}>{item}</a>*/}
                        <a onClick={() => this.choosePage(event, item)}>{item}</a>
                    </li>
                )
            })
        })
    }

    render() {
        return (
            <nav>
                <ul className="pagination">
                    {this.state.paginationButtons}
                </ul>
            </nav>
        )
    }
}
