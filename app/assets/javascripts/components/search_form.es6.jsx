class SearchForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            result: {},
            pages: {
                currentPage: 1,
                totalPages: 1
            },
            buttonDisabled: false
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    setCurrentPage(index) {
        this.setState({
            pages: {
                currentPage: index
            }
        }, this.ajaxRequest(index));
    };

    handleSubmit(event) {
        event.preventDefault();

        if (this.input.value.trim()) {
            this.setState({buttonDisabled: true, currentPage: 1});
            this.ajaxRequest(1);
        }
    }

    ajaxRequest(page) {
        $.ajax(
            {
                url: '/search',
                type: 'GET',
                data: {query: this.input.value, page: page},
                success: (response) => this.setState({
                    result: response.data,
                    pages: {
                        currentPage: response.currentPage,
                        totalPages: response.pages
                    },
                    buttonDisabled: false
                })
            }
        )
    }

    render() {
        return (
            <div className="col-xs-12">
                <div className="form-group">
                    <form onSubmit={this.handleSubmit}>
                        <label htmlFor="search">
                            Find:
                        </label>
                        <input className="form-control" type="text" name="search" ref={(input) => this.input = input}/>
                        <input className="btn btn-default" type="submit" disabled={this.state.buttonDisabled}
                               value="Submit"/>
                    </form>
                </div>
                <Results data={this.state.result}/>
                <Pagination data={this.state.pages} setCurrentPage={this.setCurrentPage.bind(this)}/>
            </div>
        )
    }
}
