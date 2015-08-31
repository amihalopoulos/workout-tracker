var ExerciseName = React.createClass({
    render: function() {
      var url = "/exercises/" + this.props.exercise.id + "/chart"
        return (<p className="ex_names_list"><a href={url} className="chart_link" data-remote="true">{this.props.exercise.name}</a></p>);
    }
});

var ExerciseContainer = React.createClass({
    render: function() {
      var props = this.props;
      var rows = props.exercises
                .filter(function(exercise){
                  return exercise.name.toLowerCase().indexOf(props.filterText.toLowerCase()) > -1;
                })
                .map(function(exercise){
                  return <ExerciseName key={exercise.name} exercise={exercise} />;
                  });
      return (
          <div>
            {rows}
          </div>
        );
    }
})

var SearchBar = React.createClass({
    handleChange: function() {
        this.props.onUserInput(
            this.refs.filterTextInput.getDOMNode().value
        );
    },
    render: function() {
        return (

          <form id="search_form" onSubmit={this.handleSubmit}>
            <input ref="filterTextInput" value={this.props.filterText} onChange={this.handleChange} type="search" placeholder="Search for exercise" />
          </form>
        );
    }
});

var FilterableExerciseContainer = React.createClass({
    getInitialState: function() {
        return {
            filterText: ''
        };
    },

    handleUserInput: function(filterText) {
        this.setState({
            filterText: filterText
        });
    },

    render: function() {
        return (
            <div id="user_stats_info">
                <SearchBar onUserInput={this.handleUserInput} filterText={this.state.filterText} />
                <ExerciseContainer filterText={this.state.filterText} exercises={this.props.exercises} />
            </div>
        );
    }
});
