class Vampire {
  constructor(name, yearConverted) {
    this.name = name;
    this.yearConverted = yearConverted;
    this.offspring = [];
    this.creator = null;
  }

  /** Simple tree methods **/

  // Adds the vampire as an offspring of this vampire
  addOffspring(vampire) {
    this.offspring.push(vampire);
    vampire.creator = this;
  }

  // Returns the total number of vampires created by that vampire
  get numberOfOffspring() {
    if(this.offspring.length === 0){
      return 0;
    }else{
      var total = 0;
      for(var tmpOffSpring of this.offspring){
        total++;
        total = total + tmpOffSpring.numberOfOffspring;
      }
      return total;
    }
  }

  // Returns the number of vampires away from the original vampire this vampire is
  get numberOfVampiresFromOriginal() {
    let tmpVpr = this;
    let total = 0;
    while(tmpVpr.creator !== null){
      total++;
      tmpVpr = tmpVpr.creator;
    }
    return total;
  }

  // Returns true if this vampire is more senior than the other vampire. (Who is closer to the original vampire)
  isMoreSeniorThan(vampire) {
    return this.numberOfVampiresFromOriginal < vampire.numberOfVampiresFromOriginal;
  }


  //Return all offspring
  get allOffspring(){
   if(this.offspring.length === 0){
    return [];
   }else{
     var all = [];
     for(var tmpOffspring of this.offspring){
      all.push(tmpOffspring);
      if(tmpOffspring.allOffspring.length > 0){
        all = all.concat(tmpOffspring.allOffspring);
      }
     }
     return all;
   }
  }

  isAncestorOf(vampire){
    if(this.creator === null){
      return true
    }
    if(this.offspring.length === 0){
      return false;
    }else{
      var found = false;
      for(var tmpOffspring of this.offspring){
        if(tmpOffspring.name === vampire.name){
          return true;
        }
        found = tmpOffspring.isAncestorOf(vampire);
      }
      return found;
    }
  }
  /** Stretch **/

  // Returns the closest common ancestor of two vampires.
  // The closest common anscestor should be the more senior vampire if a direct ancestor is used.
  // For example:
  // * when comparing Ansel and Sarah, Ansel is the closest common anscestor.
  // * when comparing Ansel and Andrew, Ansel is the closest common anscestor.
  closestCommonAncestor(vampire) {
    if(this.creator === null){
      return this;
    }else{
      let tmpAncestor = this;
      if(tmpAncestor.name === vampire.name){
        return tmpAncestor;
      }
      if(tmpAncestor.isAncestorOf(vampire)){
        return tmpAncestor;
      }
      if(vampire.isAncestorOf(tmpAncestor)){
        return vampire;
      }
      while(tmpAncestor.isAncestorOf(vampire) === false){
        tmpAncestor = tmpAncestor.creator;
      }
      return tmpAncestor;
    }
  }
}


var rootVampire = new Vampire("root",0);
offspring1 = new Vampire("a",1);
offspring2 = new Vampire("b",2);
offspring3 = new Vampire("c",3);
offspring4 = new Vampire("d",4);
offspring5 = new Vampire("e",5);
offspring6 = new Vampire("f",6);
offspring7 = new Vampire("g",7);
offspring8 = new Vampire("h",8);

rootVampire.addOffspring(offspring1);
rootVampire.addOffspring(offspring2);
rootVampire.addOffspring(offspring3);
offspring3.addOffspring(offspring4);
offspring3.addOffspring(offspring5);
offspring5.addOffspring(offspring6);
offspring6.addOffspring(offspring7);
offspring2.addOffspring(offspring8);

console.log(offspring7.isAncestorOf(offspring6));
console.log(offspring6.isAncestorOf(offspring7));
module.exports = Vampire;

