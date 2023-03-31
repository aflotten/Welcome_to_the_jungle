
describe("Can add product to cart and see cart-count increase by 1", () => {

  it("", () => {
    cy.visit("/")
    cy.contains('My Cart (0)')
    cy.get('.btn').first().click({force: true})
    cy.contains('My Cart (1)')
  })
})