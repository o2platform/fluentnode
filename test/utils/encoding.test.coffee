require('../../src/fluentnode')

describe '|utils | encoding.test |',->
  url_Encoded_Chars         = '#@$%^&+=[][];\\:"|,/<>?'
  url_Encoded_Chars_Decoded = '%23%40%24%25%5E%26%2B%3D%5B%5D%5B%5D%3B%5C%3A%22%7C%2C%2F%3C%3E%3F'
  url_Encoded_Skipped_Chars = '!*()_-\'.'

  it 'url_Encode',->

    url_Encoded_Chars.url_Encode()
                     .assert_Is(url_Encoded_Chars_Decoded)
                     .split('%').remove_First().size()
                     .assert_Is url_Encoded_Chars.size()

    url_Encoded_Skipped_Chars.url_Encode()
                             .assert_Is url_Encoded_Skipped_Chars


    ''.encode_Url.assert_Is ''.url_Encode

  it 'url_Decode',->
    url_Encoded_Chars_Decoded.url_Decode().assert_Is url_Encoded_Chars
    url_Encoded_Chars_Decoded.url_Decode().url_Encode().assert_Is url_Encoded_Chars_Decoded
    url_Encoded_Skipped_Chars.url_Decode().assert_Is url_Encoded_Skipped_Chars
    ''.decode_Url.assert_Is ''.url_Decode