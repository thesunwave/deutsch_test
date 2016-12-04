class Results extends React.Component {

    constructor(props) {
        super(props);
        this.state = {resultList: []}
    }

    componentWillReceiveProps(nextProps) {
        this.setState({
            resultList: $.map(nextProps.data, (item, index) => {
                return (
                    <tr key={index}>
                        <th>{item.prefix}</th>
                        <th>{item.usage}</th>
                        <th>{item.comment}</th>
                    </tr>
                )
            })
        })
    }

    render() {
        return (
            <table className="table table-striped">
                <thead>
                <tr>
                    <th>Prefix</th>
                    <th>Usage</th>
                    <th>Comment</th>
                </tr>
                </thead>
                <tbody>
                    {this.state.resultList}
                </tbody>
            </table>
        )
    }
}
