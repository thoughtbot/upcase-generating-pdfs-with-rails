class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_invoice_pdf }
    end
  end

  private

  def invoice
    Invoice.find(params[:invoice_id])
  end

  def download
    Download.new(invoice)
  end

  def send_invoice_pdf
    send_file download.to_pdf, download_attributes
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end
end
