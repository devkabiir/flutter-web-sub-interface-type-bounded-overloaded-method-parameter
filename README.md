# Minimum re-producible for flutter web compilation failure.

## Description

Flutter fails to compile an app for the web target if the source code 
 - contains a super interface `Base` which has a method `M` with a
body. (even if not used anywhere)
- contains a sub-interface of `Base` called `SubInterface` with a type parameter `T` which overrides
_and_ overloads method `M` by adding optional named/positional parameter whose
type is bound to `T` and not providing a body for the overloaded method `M`.

Flutter does not fail to compile if the optional/named parameter is not bound to
`T`, for example it can be of type `bool?`. In this case flutter successfully
compiles with and without a body for the overloaded method `M`.

Here, overloading a method refers to a different type signature than that of the
original method. Dart doesn't exactly support overloading methods, and one can
stretch it's meaning to a limited version which allows adding non-conflicting
optional parameters to the method.

## Steps to test
- Open `main.dart` in your favourite editor 
- Comment out `TestFailure` mixin and run `flutter test && flutter run -d chrome`
  This should successfully pass the tests (which run in VM) and compile the app
  for web target.

- With presence of `TestFailure` mixin, running `flutter test && flutter run -d chrome`
  Will result in tests passing (which run in VM) and failure to compile for web
  target.

- There are other commented out success/failure cases in the `main.dart` file which
  can also be tried if so desired.
