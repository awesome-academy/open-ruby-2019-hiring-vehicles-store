class AllItems extends React.Component {
  constructor(props) {
    super(props);
    this.state = {services: []}
  }

  componentDidMount() {
    $.getJSON('/api/v1/services.json', (response) => { this.setState({ services: response }) });
  }

  render() {
    var services = this.state.services.map((service) => {
      return(
        <div key={service.id}>
          <label>{I18n.t("admin.services.index.name")}</label>: <h1>{service.name}</h1>
          <label>{I18n.t("admin.services.index.price")}</label>: <h2>{service.price}</h2>
        </div>
      )
    })
    return (
      <div>
        {services}
      </div>
    );
  }
}
