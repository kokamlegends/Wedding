<form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="varchar">Nama Lengkap P <?php echo form_error('nama_lengkap_p') ?></label>
            <input type="text" class="form-control" name="nama_lengkap_p" id="nama_lengkap_p" placeholder="Nama Lengkap P" value="<?php echo $nama_lengkap_p; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Nama Panggilan P <?php echo form_error('nama_panggilan_p') ?></label>
            <input type="text" class="form-control" name="nama_panggilan_p" id="nama_panggilan_p" placeholder="Nama Panggilan P" value="<?php echo $nama_panggilan_p; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Nama Lengkap W <?php echo form_error('nama_lengkap_w') ?></label>
            <input type="text" class="form-control" name="nama_lengkap_w" id="nama_lengkap_w" placeholder="Nama Lengkap W" value="<?php echo $nama_lengkap_w; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Nama Panggilan W <?php echo form_error('nama_panggilan_w') ?></label>
            <input type="text" class="form-control" name="nama_panggilan_w" id="nama_panggilan_w" placeholder="Nama Panggilan W" value="<?php echo $nama_panggilan_w; ?>" />
        </div>
	    <div class="form-group">
            <label for="date">Tanggal Pernikahan <?php echo form_error('tanggal_pernikahan') ?></label>
            <input type="text" class="form-control" name="tanggal_pernikahan" id="tanggal_pernikahan" placeholder="Tanggal Pernikahan" value="<?php echo $tanggal_pernikahan; ?>" />
        </div>
	    <div class="form-group">
            <label for="alamat_pernikahan">Alamat Pernikahan <?php echo form_error('alamat_pernikahan') ?></label>
            <textarea class="form-control" rows="3" name="alamat_pernikahan" id="alamat_pernikahan" placeholder="Alamat Pernikahan"><?php echo $alamat_pernikahan; ?></textarea>
        </div>
	    <div class="form-group">
            <label for="time">Waktu Mulai <?php echo form_error('waktu_mulai') ?></label>
            <input type="text" class="form-control" name="waktu_mulai" id="waktu_mulai" placeholder="Waktu Mulai" value="<?php echo $waktu_mulai; ?>" />
        </div>
	    <div class="form-group">
            <label for="time">Waktu Selesai <?php echo form_error('waktu_selesai') ?></label>
            <input type="text" class="form-control" name="waktu_selesai" id="waktu_selesai" placeholder="Waktu Selesai" value="<?php echo $waktu_selesai; ?>" />
        </div>
	    <div class="form-group">
            <label for="int">Id User <?php echo form_error('id_user') ?></label>
            <input type="text" class="form-control" name="id_user" id="id_user" placeholder="Id User" value="<?php echo $id_user; ?>" />
        </div>
	    <div class="form-group">
            <label for="tinyint">Status <?php echo form_error('status') ?></label>
            <input type="text" class="form-control" name="status" id="status" placeholder="Status" value="<?php echo $status; ?>" />
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('admin/t_pernikahan') ?>" class="btn btn-default">Cancel</a>
	</form>