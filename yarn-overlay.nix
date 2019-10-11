self: super:

{
  yarn = super.yarn.override {
    buildInputs = [ super.nodejs-11_x ];
  };
}
