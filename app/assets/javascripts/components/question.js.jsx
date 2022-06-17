var Question = React.createClass({
  getInitialState() {
      return {
        isSelected: false,
        question: this.props.question,
        editMode: false,
        errors: {}
      }
    },

    toggleDetail(e) {
      this.setState({isSelected: !this.state.isSelected});
    },

    setEditMode() {
      this.setState({editMode: true});
    },

    handleEmployeeFire() {
    var that = this;
    $.ajax({
      method: 'DELETE',
      url: '/adm/questions/' + that.state.question.id + '.json',
      success: function(res) {
        that.props.onFireEmployee(that.state.question);
      }
    })
  },

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

    showDetail(e) {
      var newEmployee = this.state.question;
      newEmployee.active = e.target.value;
      this.setState({question: newEmployee});
    },

    toggleActiveStatus() {
      var newEmployee = this.state.question;
      newEmployee.active = !this.state.question.active;
      this.setState({question: newEmployee});
      this.handleEmployeeDeactivate();
    },


    handleEmployeeDeactivate() {
    var that = this;
    $.ajax({
      method: 'PUT',
      data: {
        question: {active:that.state.question.active},
      },
      url: '/adm/questions/' + that.state.question.id + '.json',
      success: function(res) {
        that.setState({
          errors: {},
          question: res,
          editMode: false
        });
      },
      error: function(res) {
        that.setState({errors: res.responseJSON.errors});
      }
    });
  },

  handleEmployeeUpdate() {
  var that = this;
  $.ajax({
    method: 'PUT',
    data: {
      question: {title:that.state.question.title},
    },
    url: '/adm/questions/' + that.state.question.id + '.json',
    success: function(res) {
      that.setState({
        errors: {},
        question: res,
        editMode: false
      });
    },
    error: function(res) {
      that.setState({errors: res.responseJSON.errors});
    }
  });
},

  render() {

    var isSelected = this.state.isSelected;
        var style = {
            'backgroundColor': ''
        };
        if (isSelected) {
            style = {
                'backgroundColor': '#ccc'
            };
        }


     if ( this.state.editMode ) {
       markup = (
         <tr>
           <td>
             <input
               type="text"
               value={this.state.question.title}
               onChange={this.handleTitleChange} />
             <span style={{color: 'red'}}>{this.state.errors.title}</span>
           </td>

           <td>
             <input
               type="checkbox"
               value={this.state.question.active}
               onChange={this.handleActiveChange} />
           </td>
           <td>
             <button onClick={this.handleEmployeeUpdate}>Save</button>
           </td>
         </tr>
       );
     } else {
       markup = (
         <tr onClick={this.toggleDetail} style={style}>
           <td>{this.state.question.title}</td>
           <td>{this.state.question.active ? '✔' : ''}</td>
           <td>
             <button onClick={this.setEditMode}>Edit</button>
             <button onClick={this.toggleActiveStatus}>{this.state.question.active ? 'deactivate' : 'activate'}</button>
             <button onClick={this.handleEmployeeFire} style={{color: 'red'}}>delete</button>
           </td>
         </tr>
       );
     }
     return markup;
   }
 });
