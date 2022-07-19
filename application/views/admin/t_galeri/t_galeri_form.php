<form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="int">Id Pernikahan <?php echo form_error('id_pernikahan') ?></label>
            <input type="text" class="form-control" name="id_pernikahan" id="id_pernikahan" placeholder="Id Pernikahan" value="<?php echo $id_pernikahan; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Nama Foto <?php echo form_error('nama_foto') ?></label>
            <input type="text" class="form-control" name="nama_foto" id="nama_foto" placeholder="Nama Foto" value="<?php echo $nama_foto; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Judul <?php echo form_error('judul') ?></label>
            <input type="text" class="form-control" name="judul" id="judul" placeholder="Judul" value="<?php echo $judul; ?>" />
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('admin/t_galeri') ?>" class="btn btn-default">Cancel</a>
	</form>