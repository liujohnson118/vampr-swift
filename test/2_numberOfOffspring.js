const chai = require('chai');
const expect = chai.expect;

const Vampire = require('../vampire.js');

describe("Vampire", function() {

  let rootVampire;
  beforeEach( function() {
    rootVampire = new Vampire("root");
  });

  describe("numberOfOffspring", () => {

    it("should get the correct number of offspring", () => {
      let vpr1 = new Vampire();
      let vpr2 = new Vampire();
      let vpr3 = new Vampire();
      let vpr4 = new Vampire();
      let vpr5 = new Vampire();
      let vpr6 = new Vampire();
      let vpr7 = new Vampire();
      let vpr8 = new Vampire();


      expect(rootVampire.numberOfOffspring).to.equal(0);
      rootVampire.addOffspring(vpr1);
      expect(rootVampire.numberOfOffspring).to.equal(1);
      rootVampire.addOffspring(vpr2);
      rootVampire.addOffspring(vpr3);
      rootVampire.addOffspring(vpr4);
      rootVampire.addOffspring(vpr5);
      vpr5.addOffspring(vpr6);
      vpr5.addOffspring(vpr7);
      vpr7.addOffspring(vpr8);
      expect(rootVampire.numberOfOffspring).to.equal(8);
    });
  });
});
