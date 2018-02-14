const chai = require('chai');
const expect = chai.expect;

const Vampire = require('../vampire.js');

describe("Vampire", function() {

  let rootVampire;
  beforeEach( function() {
    rootVampire = new Vampire("root",0);
  });

  describe("allOffspring", () => {

    it("should get all offspring", () => {
      var vpr1 = new Vampire('vpr1',1);
      var vpr2 = new Vampire('vpr2',2);
      var vpr3 = new Vampire('vpr3',3);
      var vpr4 = new Vampire('vpr4',4);
      var vpr5 = new Vampire('vpr5',5);
      var vpr6 = new Vampire('vpr6',6);
      var vpr7 = new Vampire('vpr7',7);
      var vpr8 = new Vampire('vpr8',8);
      rootVampire.addOffspring(vpr1);
      rootVampire.addOffspring(vpr2);
      rootVampire.addOffspring(vpr3);
      rootVampire.addOffspring(vpr4);
      rootVampire.addOffspring(vpr5);
      vpr5.addOffspring(vpr6);
      vpr5.addOffspring(vpr7);
      vpr7.addOffspring(vpr8);


      // expect(rootVampire.numberOfOffspring).to.equal(0);

      expect(vpr5.allOffspring[0].name).to.equal("vpr6");
      expect(vpr5.allOffspring[1].name).to.equal("vpr7");
      expect(vpr7.allOffspring[0].name).to.equal("vpr8");
    });
  });
});
