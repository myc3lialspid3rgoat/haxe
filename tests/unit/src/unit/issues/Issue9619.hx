package unit.issues;

#if (java || cs)

private abstract class AbstractOverloadParent {
	public function new():Void {}

	@:overload
	abstract function abstractFunction():Void;

	@:overload
	abstract function abstractFunction(i:Int):Void;
}

private class ConcreteOverloadChild extends AbstractOverloadParent {
	public function new() {
		super();
	}

	@:overload
	override function abstractFunction():Void {}

	@:overload
	override function abstractFunction(i:Int):Void {}
}

private interface InterfaceToBeImplemented {
	@:overload function toBeImplemented():Bool;
	@:overload public function toBeImplemented(i:Int):Int;
}

abstract class AbstractThatImplementsInterface implements InterfaceToBeImplemented {
	public function new() {}
}

class ConcreteChildThatImplements extends AbstractThatImplementsInterface {
	@:overload
	public override function toBeImplemented() {
		return true;
	}

	@:overload
	public override function toBeImplemented(i:Int) {
		return i * 2;
	}
}

#end

abstract private class AbstractParent {
	public function new():Void {}

	abstract function abstractFunction():Void;
}

private class ConcreteChild extends AbstractParent {
	public function new() {
		super();
	}

	override function abstractFunction():Void {}
}

class Issue9619 extends unit.Test {
	function test() {
		#if (java || cs)
		var cc = new ConcreteOverloadChild();
		t(HelperMacros.typeError(new AbstractOverloadParent()));

		var atii:AbstractThatImplementsInterface = new ConcreteChildThatImplements();
		t(atii.toBeImplemented());
		eq(24, atii.toBeImplemented(12));
		#end
		var cc = new ConcreteChild();

		t(HelperMacros.typeError(new AbstractParent()));
		utest.Assert.pass();
	}
}