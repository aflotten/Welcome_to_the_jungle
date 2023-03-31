describe("Can click on product and render product show page", () => {

  it("can click on and render a product", () => {
    cy.visit("/")
    cy.get('[alt="Giant Tea"]').click()
    cy.get('.products-show').should('exist')
  })
})