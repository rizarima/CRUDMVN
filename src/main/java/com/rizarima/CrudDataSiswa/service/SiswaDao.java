
package com.rizarima.CrudDataSiswa.service;

import com.rizarima.CrudDataSiswa.domain.Siswa;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 *
 * @author rizarima
 */
public interface SiswaDao extends PagingAndSortingRepository<Siswa, String> {
    
}
