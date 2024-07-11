package dapp.repository;

import dapp.model.LoginModel;

public interface ValidateUserRepo {

	public LoginModel isValidate(LoginModel model);
}
