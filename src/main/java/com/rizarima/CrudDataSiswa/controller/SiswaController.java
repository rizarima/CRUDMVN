package com.rizarima.CrudDataSiswa.controller;

import com.rizarima.CrudDataSiswa.domain.Siswa;
import com.rizarima.CrudDataSiswa.service.SiswaDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author rizarima
 */

@RestController
@RequestMapping("/api/siswa")
public class SiswaController {
    @Autowired
    private SiswaDao siswaDao;
    
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public Siswa findSiswaById(@PathVariable String id)
    {
        return siswaDao.findOne(id);
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public void save(@RequestBody Siswa siswa)
    {
        siswaDao.save(siswa);
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public Page<Siswa> findAll(Pageable pageable)
    {
        return siswaDao.findAll(pageable);
    }
    
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public void delete(@PathVariable String id)
    {
        Siswa siswa = siswaDao.findOne(id);
        if(siswa != null) {
            siswaDao.delete(siswa);
        }
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public void edit(@PathVariable String id, @RequestBody Siswa s)
    {
        Siswa siswa = siswaDao.findOne(id);
        if(siswa != null) {
            s.setId(id);
            siswaDao.save(s);
        }
    }
}
