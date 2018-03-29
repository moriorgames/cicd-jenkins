var expect = require('chai').expect;

var foo = 'bar';

describe('Executing sandbox test', () => {
    it('Foo Should be a String', () => {
        expect(foo).to.be.a('string');
    });
    it('Foo Should be equal bar', () => {
        expect(foo).to.equal('bar');
    });
    it('Foo Should be length 3', () => {
        expect(foo).to.have.lengthOf(3);
    });
});
