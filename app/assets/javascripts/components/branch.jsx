class Branchs extends React.Component {
  constructor(props) {
    super()

    this.state = { 
      id: '',
      name: '',
    }
  }

  deleteItem(id) {
    let finalUrl = 'branchs/' + id;
    $.ajax({
      type: 'DELETE',
      url: finalUrl,
    })
  }

  render() {
    var branchs = this.props.branchs.map((branch) => {
      return (
        <tr>
          <td>{branch.name}</td>
          <td><a className="btn btn-primary" href="#">{I18n.t("admin.branchs.index.update")}</a></td>
          <td><button className="btn btn-warning"
            onClick={this.deleteItem(branch.id)}>{I18n.t("admin.branchs.index.remove")}</button></td>
        </tr>
      )
    })

    return(
      <tbody>
        {branchs}
      </tbody>
    )
  }
}
