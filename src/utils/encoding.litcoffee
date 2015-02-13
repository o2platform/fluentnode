##Utils - Encoding

These methods provide multiple helpers to common encoding and transformation actions

String::**encodeURIComponent**

twin methods: encode_Url

    String::url_Encode = ()->
      encodeURIComponent(@)

    String::encode_Url = String::url_Encode


String::**decodeURIComponent**

twin methods: decode_Url

    String::url_Decode = ()->
      decodeURIComponent(@)

    String::decode_Url = String::url_Decode