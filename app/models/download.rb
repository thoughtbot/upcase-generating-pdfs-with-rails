require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(invoice)
    @invoice = invoice
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/invoice.pdf")
  end

  def filename
    "Invoice #{invoice.number}.pdf"
  end

  def render_attributes
    {
      template: "invoices/pdf",
      layout: "invoice_pdf",
      locals: { invoice: invoice }
    }
  end

  private

  attr_reader :invoice

  def as_html
    render render_attributes
  end
end
