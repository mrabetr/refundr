class OcrService
  # Imports the Google Cloud client library
  # require 'google/cloud/vision'
  # Set up the envirenment with the API key

  # ENV['GOOGLE_APPLICATION_CREDENTIALS'] = Rails.root.join('app', 'services', 'refundr4.json').to_s
  # ENV['GOOGLE_APPLICATION_CREDENTIALS'] = JSON.parse(ENV.fetch('GOOGLE_APPLICATION_CREDENTIALS'))

  def detect_text(image_path)
    # Method requires the path of the image file to annotate

    # [START vision_text_detection]
    # Instantiates a client
    # image_annotator = Google::Cloud::Vision::ImageAnnotator.new(credentials: JSON.parse(ENV.fetch('GOOGLE_APPLICATION_CREDENTIALS')))
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
    result = response.responses.first.text_annotations.first.description.split("\n")
    # p array
    # results = array.select { |text| text.include? "Тахable" }
    # p index = array.find_index { |item| item == "Total" }
    # p index = array.find_index { |item| item.include? "Тахable" }
    # p array[index + 1]

    results = {
      shop: result[0].gsub(/\s+/, ''),
      shop_vat_no: result[-2],
      shop_address: result[2],
      transaction_no: result[6],
      date: result[7],
      total: result[44].to_f,
      total_excl_vat: result[40].to_f
    }
    return results
  end
end

# image_path = 'services/photos/gucci3.jpg'
# p OcrService.new.detect_text(image_path)
