class PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end

  def new
    @pdf = Pdf.new
  end

  def create
  end

  def destroy
    @pdf = Pdf.find(params[:id])
      @pdf.destroy
      redirect_to pdfs_path, notice:  "The PDF #{@pdf.name} has been deleted."
   end
  end

  private
      def pdf_params
      params.require(:pdf).permit(:name, :attachment)
   end
end
