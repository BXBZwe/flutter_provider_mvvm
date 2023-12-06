import '../mocks.mocks.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockAuthProvider mockAuthProvider;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
    // Initially, the user is not logged in
    when(mockAuthProvider.isLoggedIn).thenReturn(false);
  });

  test('MockAuthProvider should initially return false for isLoggedIn', () {
    expect(mockAuthProvider.isLoggedIn, false);
  });

  // Additional tests for MockAuthProvider can be added here
}
