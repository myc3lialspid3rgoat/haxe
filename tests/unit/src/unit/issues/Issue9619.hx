package unit.issues;

#if (java || cs)

@:abstract
private class AbstractOverloadParent {
	public function new():Void {}

	@:overload
	@:abstract
	function abstractFunction():Void;

	@:overload
	@:abstract
	function abstractFunction(i:Int):Void;
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

#end

@:abstract
private class AbstractParent {
	public function new():Void {}

	@:abstract
	function abstractFunction():Void;
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
		#end
		var cc = new ConcreteChild();
		utest.Assert.pass();
	}
}