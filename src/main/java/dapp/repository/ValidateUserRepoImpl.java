package dapp.repository;

import dapp.model.LoginModel;

public class ValidateUserRepoImpl extends DBParent implements ValidateUserRepo{

	public LoginModel isValidate(LoginModel model) {
		try {
			
			stmt=conn.prepareStatement("select *from login where uname=? and upass=?");
			stmt.setString(1, model.getUsername());
			stmt.setString(2, model.getPassword());
			
			rs=stmt.executeQuery();
			if(rs.next()) {
				model.setLoginType(rs.getString("login_type"));
			}
			return model;
		
		}
		catch(Exception ex) {
			System.out.println("Error is:- "+ex);
			return null;
		}
	}
}
