class OcrService
  # Imports the Google Cloud client library
  # require 'google/cloud/vision'
  # Set up the envirenment with the API key

  ENV['GOOGLE_APPLICATION_CREDENTIALS'] = Rails.root.join('app', 'services', 'refundr2.json').to_s

  def detect_text(image_path)
    # Method requires the path of the image file to annotate

    # [START vision_text_detection]
    # Instantiates a client
    image_annotator = Google::Cloud::Vision.image_annotator

    # [START vision_text_detection_migration]
    response = image_annotator.document_text_detection(
      image:       image_path,
      max_results: 1 # optional, defaults to 10
    )

    # Performs text detection on the image file
    # response.responses.each do |res|
    #   res.text_annotations.each do |text|
    #     puts text.description
    #   end
    # end
    # [END vision_text_detection_migration]
    # [END vision_text_detection]

    # Performs text detection on image file returning the main string
    # puts response.responses.first.text_annotations.first.description
    array = response.responses.first.text_annotations.first.description.split("\n")
    # p array
    # results = array.select { |text| text.include? "Тахable" }
    # p index = array.find_index { |item| item == "Total" }
    # p index = array.find_index { |item| item.include? "Тахable" }
    # p array[index + 1]

    results = {
      shop: array[0].gsub(/\s+/, ''),
      shop_vat_no: array[-2],
      shop_address: array[2],
      transaction_no: array[6],
      date: array[7],
      total: array[44].to_f,
      total_excl_vat: array[40].to_f
    }
    return results
  end
end

# image_path = 'services/photos/gucci3.jpg'
# p OcrService.new.detect_text(image_path)
