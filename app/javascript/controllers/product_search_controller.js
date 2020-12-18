// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import {Controller} from "stimulus"

export default class extends Controller {
  static targets = ["search", "result"]

  connect() {
    this.url = this.searchTarget.dataset.url
    this.productUrl = this.searchTarget.dataset.productUrl
    this.resultItemTemplate = `<a href="%link_url%"><li class="m-1 p-2 bg-yellow-200 hover:bg-yellow-400">%text%</li></a>`
  }

  async search() {
    const search = this.searchTarget.value
    const url = `${this.url}?search=${search}`
    if (search.length <= 2) { return this.clearResultList() }

    const products = await fetch(url).then(response => response.json())

    this.hideResultList(products.length === 0)
    this.resultTarget.innerHTML = this.resultList(products).outerHTML
  }

  hideResultList = (show = true) => this.resultTarget.classList.toggle("hidden", show)

  showResultList = () => this.hideResultList(false)

  clearResultList() {
    this.resultTarget.innerHTML = ''
    this.hideResultList()
  }

  resultList(products) {
    const list = document.createElement("ul")

    products.forEach((product) => {
      const href = `${this.productUrl}/${product.id}`
      const link = this.resultItemTemplate.replace("%link_url%", href).replace("%text%", product.name)
      list.innerHTML += link
    })
    return list
  }
}
