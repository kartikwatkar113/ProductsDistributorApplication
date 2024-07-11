package dapp.service;

import java.util.List;

import dapp.model.VenderModel;
import dapp.repository.VenderRepo;
import dapp.repository.VenderRepoImpl;
public class VenderServiceImpl implements VenderService {

	VenderRepo vrepo=new VenderRepoImpl();
	
	@Override
	public boolean isAddNewVender(VenderModel model) {
		// TODO Auto-generated method stub
		return vrepo.isAddNewVender(model);
	}

	@Override
	public List<VenderModel> getVenderList() {	
		return vrepo.getVenderList();
	}

	@Override
	public boolean isDeleteVenderById(int v_id) {
		// TODO Auto-generated method stub
		return vrepo.isDeleteVenderById(v_id);
	}

	@Override
	public List<VenderModel> getVenderListByName(String vname) {
		
		return vrepo.getVenderListByName(vname);
	}

}
