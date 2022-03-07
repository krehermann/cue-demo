package foo 

#Node: {
	name: string
	inputs?: [...#Node]
}
#Graph: {
	nodes: [...#Node]
}

test_node: #Node & {
	name: "a"
}

test_graph: #Graph & {
	nodes: [ {
		name: "a"
		}]
}

test_graph2: {
    let a = #Node & {
		name: "a"
	}

	let b = #Node & {
		name: "b"
		inputs: [a]
	}
	let g = #Graph & {
		nodes: [a, b]
	}
	
	g
}
