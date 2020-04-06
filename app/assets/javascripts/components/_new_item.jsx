class NewItem extends React.Component{
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      name: '',
      price: '',
      vehicle_id: ''
    }
  }

  handleChange(event) {
    this.setState({[event.target.name]: event.target.value});
  }

  handleClick() {
    $.ajax({
    url: '/api/v1/services',
    type: 'POST',
    data: {service: this.state},
    success: response => {
      alert(I18n.t("admin.services.index.success"), response);
    }
  })
}

  render() {
    return(
      <div>
        <label>{I18n.t("admin.services.index.name")}</label>
        <input type="text" name='name' onChange={this.handleChange}/>

        <label>{I18n.t("admin.services.index.price")}</label>
        <input type="text" name='price' onChange={this.handleChange}/>

        <label>{I18n.t("admin.services.index.vehicle")}</label>
        <input type="text" name='vehicle_id' onChange={this.handleChange} />

        <button onClick={this.handleClick}>{I18n.t("admin.services.index.new")}</button>
      </div>
    )
  }
}
