class SearchForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {value: ''};
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(event) {
        this.setState({value: event.target.value});
    }

    handleSubmit(event) {
        alert('A name was submitted: ' + this.input.value);
        event.preventDefault();
    }

    render() {
        return (
            <div className="col-xs-12">
                <div className="form-group">
                    <form onSubmit={this.handleSubmit}>
                        <label for="search">
                            Find:
                        </label>
                        <input className="form-control" type="text" name="search" ref={(input) => this.input = input} />
                        <input className="btn btn-default" type="submit" value="Submit"/>
                    </form>
                </div>

            </div>
        )
    }
}
