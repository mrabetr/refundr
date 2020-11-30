class OcrService
  def detect_text(image_path)
    # Instantiates a client
    image_annotator = Google::Cloud::Vision.image_annotator

    # [START vision_text_detection_migration]
    response = image_annotator.document_text_detection(
      image:       image_path,
      max_results: 1 # optional, defaults to 10
    )

    # Performs text detection on image file returning the main string
    results = response.responses.first.text_annotations.first.description.split("\n")

    result = {
      shop: results[0].gsub(/\s+/, ''),
      shop_vat_no: results[-2].split(",").first,
      shop_address: results[2],
      transaction_no: results[6].split(" ").last,
      date: Date::strptime(results[7].split(" ")[1], "%e/%m/%y"),
      items_attributes: {
        "0" => {
          quantity: 1,
          description: results[18],
          price: results[17].split(" ").first.to_f
        },
        "1" => {
          quantity: 1,
          description: results[23],
          price: results[22].split(" ").first.to_f
        }
      }
    }
    return result
  end
end
