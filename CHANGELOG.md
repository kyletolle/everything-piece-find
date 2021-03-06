# Changelog

## 0.7.0

- Update everything-core dependency version to 0.0.7

## 0.6.0

- Update everything-core dependency version to 0.0.6

## 0.5.0

- Make #find_by_name and #find_by_name_recursive class methods on
  Everything::Piece, as was intended, instead of them being instance methods.
- Update changelog with new usage examples

## 0.4.0

- Use more descriptive error messages in #find_by_name
- Use more descriptive error messages in #find_by_name_recursive

## 0.3.0

- Add #find_by_name_recursive to search for a piece within subdirectories
- Raise error in #find_by_name when file is found instead of dir

## 0.2.0

- Raise error in #find_by_name when piece isn't found

## 0.1.0

- Rename `#find` to `#find_by_name`
- Remove `#find_path_for_piece_name`
  - Logic is now within `#find_by_name`

## 0.0.1

- Initial release
