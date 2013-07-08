// RUN: rm -rf %t
// RUN: %clang_cc1 -objcmt-migrate-literals -objcmt-migrate-subscripting -mt-migrate-directory %t %s -x objective-c -fobjc-runtime-has-weak -fobjc-arc -fobjc-default-synthesize-properties -triple x86_64-apple-darwin11
// RUN: c-arcmt-test -mt-migrate-directory %t | arcmt-test -verify-transformed-files %s.result
// RUN: %clang_cc1 -triple x86_64-apple-darwin10 -fsyntax-only -x objective-c -fobjc-runtime-has-weak -fobjc-arc -fobjc-default-synthesize-properties %s.result

@class NSString;
@interface NSObject @end

@interface I : NSObject {
  int ivarVal;
}
- (void) setWeakProp : (NSString *__weak)Val;
- (NSString *__weak) WeakProp;

- (NSString *) StrongProp;
- (void) setStrongProp : (NSString *)Val;

- (NSString *) UnavailProp  __attribute__((unavailable));
- (void) setUnavailProp  : (NSString *)Val;

- (NSString *) UnavailProp1  __attribute__((unavailable));
- (void) setUnavailProp1  : (NSString *)Val  __attribute__((unavailable));

- (NSString *) UnavailProp2;
- (void) setUnavailProp2  : (NSString *)Val  __attribute__((unavailable));

@end

@implementation I
@end