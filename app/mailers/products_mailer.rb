class ProductsMailer < ApplicationMailer
    default from: '"Hermark" <info@hermark.com>'
    layout 'mailer'
    
    def send_product(destinatary, products)
      @products = products
      mail to: destinatary, subject: 'You received a greeting card'
    end
end
