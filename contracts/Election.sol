// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract Election{
    // Model of Candidate

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Provide a key=value relationship between an unsigned int to "Candidate"
    mapping (uint=>Candidate) public candidates;

}  