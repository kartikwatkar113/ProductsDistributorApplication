package dapp.service;

import dapp.model.LoginModel;

import dapp.repository.ValidateUserRepoImpl;
import dapp.repository.ValidateUserRepo;

public class ValidateUserServiceImpl implements ValidateUserService{
	
	ValidateUserRepo validRepo=new ValidateUserRepoImpl();
	public LoginModel isValidateUser(LoginModel model) {
		return validRepo.isValidate(model);
		
		
	}
}
