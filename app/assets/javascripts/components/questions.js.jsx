var Questions = React.createClass({

  handleTitleChange(e) {
    var newEmployee = this.state.question;
    newEmployee.title = e.target.value;
    this.setState({question: newEmployee});
  },


  handleActiveChange(e) {
    var newEmployee = this.state.question;
    newEmployee.active = e.target.value;
    this.setState({question: newEmployee});
  },

  handleHireEmployee() {
     var that = this;
     $.ajax({
       method: 'POST',
       data: {
         question: that.state.question,
       },
       url: '/adm/questions.json',
       success: function(res) {
         var newEmployeeList = that.state.questions;
         newEmployeeList.push(res);
         that.setState({
           questions: newEmployeeList,
           question: {
             title: '',
             active: false
           },
           errors: {}
         });
       },
       error: function(res) {
         that.setState({errors: res.responseJSON.errors})
       }
     });
   },

  getInitialState() {
    return {
      questions: this.props.questions,
      question: {
        title: '',
        active: false
      },
      errors: {}
    }
  },
  render: function() {


    qs = this.props.questions.map( function(question) {
      return (
          <Question question={question} key={question.id} />
      );
    });
    return (
      <div>
        <h1>Question</h1>
        <div id="employees">
          <table className="table">
            <thead>
              <tr>
                <th>Name</th>
              </tr>
            </thead>
            <tbody>
              {qs}



              <tr>
                <td>
                  <input type="text" onChange={this.handleTitleChange} /><br />
                  <span style={{color: 'red'}}>{this.state.errors.title}</span>
                </td>

                <td><input type="checkbox" onChange={this.handleActiveChange} /></td>
                <td><button onClick={this.handleHireEmployee}>Hire</button></td>
              </tr>

            </tbody>
          </table>
        </div>
      </div>
    );
  }
});
