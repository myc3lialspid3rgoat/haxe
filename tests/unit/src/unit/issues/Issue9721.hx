package unit.issues;

class Issue9721 extends Test {
	function test() {
    ((null: {x: Array<Array<Int>>}): {x: MyArray<Array<Int>>});
    ((null: {x: Array<Array<Int>>}): {x: Array<MyArray<Int>>});
    ((null: {x: Array<Array<Int>>}): {x: MyArray<MyArray<Int>>});

    ((null: {x: MyArray<Array<Int>>}): {x: Array<Array<Int>>});
    ((null: {x: Array<MyArray<Int>>}): {x: Array<Array<Int>>});
    ((null: {x: MyArray<MyArray<Int>>}): {x: Array<Array<Int>>});

    ((null: Array<Array<Array<Int>>>): MyArray<MyArray<MyArray<Int>>>);
    ((null: MyArray<MyArray<MyArray<Int>>>): Array<Array<Array<Int>>>);

    ((null: {x: Int}): {x: Foo<Int>});
    ((null: {x: Int}): {x: Bar<Int>});
    ((null: {x: Foo<Int>}): {x: Int});
    ((null: {x: Bar<Int>}): {x: Int});

    ((null: {x: String}): {x: Foo<String>});
    ((null: {x: String}): {x: Bar<String>});
    ((null: {x: Foo<String>}): {x: String});
    ((null: {x: Bar<String>}): {x: String});

    t(unit.HelperMacros.typeError(((null: Array<Int>): Array<Float>)));
    t(unit.HelperMacros.typeError(((null: Array<MyInt>): Array<Float>)));

    t(unit.HelperMacros.typeError(((null: Array<Child>): Array<Parent>)));
    t(unit.HelperMacros.typeError(((null: Array<MyChild>): Array<Parent>)));
  }
}

private abstract MyArray<T>(Array<T>) from Array<T> to Array<T> {}
private abstract MyInt(Int) from Int to Int to Float {}
private abstract Foo<T>(T) from T to T {}
private abstract Bar<T>(Foo<T>) from T to T {}
private class Parent {}
private class Child extends Parent {}
private abstract MyChild(Child) to Parent {}
