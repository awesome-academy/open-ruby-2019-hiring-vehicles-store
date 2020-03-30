class Table extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      branchs: this.props.branchs
    }
  }

  render() {
    return (
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>{I18n.t("admin.branchs.index.name")}</th>
            <th>{I18n.t("admin.branchs.index.edit")}</th>
            <th>{I18n.t("admin.branchs.index.delete")}</th>
          </tr>
        </thead>
        <Branchs branchs={this.state.branchs} />
      </table>
    )
  };
}
