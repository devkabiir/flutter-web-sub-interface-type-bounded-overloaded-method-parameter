import 'package:flutter/material.dart';

mixin Base {
  /// A default implementation which is either empty body
  /// or returns anything fails to compile
  /// If there is no default implementation, it compiles
  Object? methodWithDefaultImpl() {} // This fails to compile
  // Object? methodWithDefaultImpl() => Object(); // This fails to compile
  // Object? methodWithDefaultImpl(); // This compiles
}

mixin TestSuccess<A> on Base {
  /// Adding an optional named/positional parameter which is not bound to the interface's
  /// generic type parameter compiles.
  @override
  methodWithDefaultImpl({bool? nameParam}); // This compiles
  // methodWithDefaultImpl([bool? positionalParam]); // This compiles

}

mixin TestFailure<A> on Base {
  /// Adding an optional named/positional parameter which is bound to the interface's
  /// generic type parameter fails to compile.
  @override
  methodWithDefaultImpl({A? nameParam}); // This fails to compile
  // methodWithDefaultImpl([A? positionalParam]); // This fails to compile
}

mixin TestWorkaroundForFailure<A> on Base {
  /// Adding a default implementation for the sub-interface fixes the problem, however it doesn't force
  /// users of the mixin to implement the method, since there is a default impl.
  /// available dart won't complain.
  ///
  /// So this workaround is really not that much useful.
  @override
  methodWithDefaultImpl({A? nameParam}) {} // This compiles
  // methodWithDefaultImpl([A? positionalParam]) {} // This compiles
}

void main() => runApp(app);

const app = MaterialApp(home: Text('it compiles'));
