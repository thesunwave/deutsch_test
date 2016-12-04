class SearchForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {result: {}, buttonDisabled: false};
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(event) {
        event.preventDefault();

        if (this.input.value.trim()) {
            this.setState({ buttonDisabled: true });
            $.ajax(
                {
                    url: '/search',
                    type: 'GET',
                    data: {query: this.input.value},
                    success: (response) => this.setState({result: response, buttonDisabled: false})
                }
            )
        }
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
                        <input className="btn btn-default" type="submit" disabled={this.state.buttonDisabled} value="Submit"/>
                    </form>
                </div>
                <Results data={this.state.result}/>
            </div>
        )
    }
}
