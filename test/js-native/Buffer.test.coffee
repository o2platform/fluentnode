#back to [main](fluent.html)

require('../../src/fluentnode')


describe '| js-native | Buffer',->
  it 'save_As',->
    text = 'lll'.add_5_Random_Letters()
    new Buffer(text).toString()
                    .save_As('bbb.text')
                    .assert_File_Exists()
                    .assert_File_Contents(text)
                    .assert_File_Deleted()

