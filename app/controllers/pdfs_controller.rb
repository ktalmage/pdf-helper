class PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end

  def new
    @pdf = Pdf.new
  end

  def create
    @pdf = Pdf.create(pdf_params)
    @pdf.save
    redirect_to pdfs_path, notice: "The file #{@pdf.name} has been uploaded."
  end

  def destroy
    @pdf = Pdf.find(params[:id])
      @pdf.destroy
      redirect_to pdfs_path, notice:  "The PDF #{@pdf.name} has been deleted."
   end
  

  private
      def pdf_params
      params.require(:pdf).permit(:name,:attachment)
   end
end
