require "rails_helper"

describe "User downalods PDF" do
  scenario "for an invoice with normal data" do
    product = create(:product, item_number: 'abc-123')
    invoice = create(:invoice)
    line_item = create(:line_item, product: product, invoice: invoice)

    visit invoice_path(invoice)
    click_link "Download PDF"

    expect(content_type).to eq("application/pdf")
    expect(content_disposition).to include("inline")
    expect(download_filename).to include(invoice.number)
    expect(pdf_body).to have_content(product.description)
  end

  def content_type
    response_headers["Content-Type"]
  end

  def content_disposition
    response_headers["Content-Disposition"]
  end

  def download_filename
    content_disposition.scan(/filename="(.*)"/).last.first
  end

  def pdf_body
    temp_pdf = Tempfile.new('pdf')
    temp_pdf << page.source.force_encoding('UTF-8')
    reader = PDF::Reader.new(temp_pdf)
    reader.pages.first.text
  end
end
