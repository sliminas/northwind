import {Controller} from "stimulus"

export default class extends Controller {
  static targets = ["search", "result", "clear"]
  static values = { url: String, productUrl: String }

  connect() {
    this.resultItemTemplate = `<a href="%link_url%"><li class="m-1 p-2 bg-yellow-200 hover:bg-yellow-400">%text%</li></a>`
    this.timeoutId = null
  }

  update() {
    const search = this.searchTarget.value
    if (search.length === 0) return this.clearSearch()
    if (search.length <= 2) return this.clearResultList()

    this.clearTarget.classList.remove("hidden")

    clearTimeout(this.timeoutId)

    this.timeoutId = setTimeout(async () => {
      const products = await fetch(`${this.urlValue}?search=${search}`).then(response => response.json())

      this.hideResultList(products.length === 0)
      this.resultTarget.innerHTML = this.resultList(products)
    }, 250);
  }

  clearSearch() {
    this.clearTarget.classList.add("hidden")
    this.hideResultList()
    this.searchTarget.value = ''
  }

  hideResultList = (show = true) => this.resultTarget.classList.toggle("hidden", show)

  showResultList = () => {
    if (this.searchTarget.value.length === 0 || this.resultTarget.innerHTML === '') return
    this.hideResultList(false)
  }

  clearResultList() {
    this.resultTarget.innerHTML = ''
    this.hideResultList()
  }

  resultList(products) {
    if (products.length === 0) return ''

    const list = document.createElement("ul")

    products.forEach((product) => {
      const href = `${this.productUrlValue}/${product.id}`
      const link = this.resultItemTemplate.replace("%link_url%", href).replace("%text%", product.name)
      list.innerHTML += link
    })
    return list.outerHTML
  }
}
