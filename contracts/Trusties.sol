pragma solidity ^0.4.0;

import "./IdentityToken.sol";


contract Trusties {

    mapping (bytes32 => IdentityToken) token;
    uint alpha = 85;

    function identityExists(bytes32 _identity) public view returns (bool exists) {
        return token[_identity] == address(0);
    }

    function identityRegister(bytes32 _identity) public returns (IdentityToken token) {
        token[_identity] = new IdentityTrust();
        return token[_identity];
    }

    function ratingOf(address account) public constant returns (uint256 rating) {
        return 0;
    }





    function inner_level_score() internal view returns (uint) {

    }

    function last_level_score(address account) internal view returns (uint) {
        return alpha * sqrt()
    }

    function sqrt(uint x) internal view returns (uint y) {
        uint z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}


//def trust_rank(g: nx.DiGraph, alpha=0.85) -> dict:
//def estimate_trust(node, level=0, visited_nodes=None):
//visited_nodes = visited_nodes or set()
//predecessors = set(g.predecessors(node)).difference(visited_nodes)
//
//if level >= 3:
//return 0
//elif level == 2:
//return alpha * math.sqrt(1 + len(predecessors)) - 1
//else:
//trusts = [estimate_trust(predecessor, level=level+1, visited_nodes={node, predecessor}.union(visited_nodes))
//for predecessor in predecessors if predecessor not in visited_nodes]
//avg_trust = (sum(trusts) / len(trusts)) if len(trusts) > 0 else 0
//return alpha * (avg_trust + math.sqrt(1 + sum((trust - avg_trust) ** 2 for trust in trusts if trust > avg_trust)))
//
//return {node: estimate_trust(node) - alpha for node in g.nodes}