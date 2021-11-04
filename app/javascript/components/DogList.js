import React from "react"
import axios from "axios"

class DogList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      dogs: this.props.dogs.object,
      page: this.props.page
    }
  }

  nextPage() {
    let page = this.state.page + 1
    this.dogsOnPage(page)
  }

  previousPage() {
    let page = this.state.page - 1
    this.dogsOnPage(page)
  }

  dogsOnPage(page) {
    axios.get(`/dogs?page=${page}`, {
      headers: { 'Accept': 'application/json' }
    })
      .then(response => {
        const data = response.data

        this.setState({
          dogs: data.dogs.object,
          page: page
        })
      })
  }

  dogList() {
    return this.state.dogs.map((dog) =>
      <>
      <h3>Name: { dog.name }</h3>
      <li>Age: { dog.age }</li>
      <li>Sex: { dog.sex }</li>
      <li>Breed: { dog.breed }</li>
      <li>Size: { dog.size }</li>
      <li>Training Status: { dog.trained }</li>
      <li>Vaccination Status: { dog.vaccinated }</li>
      <a href='/play_datas/new' className="btn btn-outline-primary btn-sm">Schedule Playdate with { dog.name }</a>
      <p></p>
      </>
    )
  }

  previousButton() {
    if (this.state.page == 1) {
      return <button onClick={this.previousPage.bind(this)} className="btn btn-outline-danger btn-sm" id="previous" disabled>Previous Page</button>
    } else {
      return <button onClick={this.previousPage.bind(this)} className="btn btn-outline-danger btn-sm" id="previous">Previous Page</button>
    }
  }

  nextButton() {
    if (this.state.dogs.length < 20) {
      return <button onClick={this.nextPage.bind(this)} className="btn btn-outline-success btn-sm" id="next" disabled>Next Page</button>
    } else {
      return <button onClick={this.nextPage.bind(this)} className="btn btn-outline-success btn-sm" id="next">Next Page</button>
    }
  }

  render() {
    return (
      <>
      { this.previousButton() }
      { this.nextButton() }
      <p><b>Page: { this.state.page }</b></p>
      <ul>{ this.dogList() }</ul>
      </>
    );
  }
}

export default DogList
