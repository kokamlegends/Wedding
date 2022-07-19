<div class="row" style="margin-bottom: 10px">
            <div class="col-md-4">
                <?php echo anchor(site_url('admin/t_galeri/create'),'Create', 'class="btn btn-primary"'); ?>
            </div>
            <div class="col-md-4 text-center">
                <div style="margin-top: 8px" id="message">
                    <?php echo $this->session->userdata('message') <> '' ? $this->session->userdata('message') : ''; ?>
                </div>
            </div>
            <div class="col-md-1 text-right">
            </div>
            <div class="col-md-3 text-right">
                <form action="<?php echo site_url('admin/t_galeri/index'); ?>" class="form-inline" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="q" value="<?php echo $q; ?>">
                        <span class="input-group-btn">
                            <?php 
                                if ($q <> '')
                                {
                                    ?>
                                    <a href="<?php echo site_url('admin/t_galeri'); ?>" class="btn btn-default">Reset</a>
                                    <?php
                                }
                            ?>
                          <button class="btn btn-primary" type="submit">Search</button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id Pernikahan</th>
		<th>Nama Foto</th>
		<th>Judul</th>
		<th>Action</th>
            </tr><?php
            foreach ($t_galeri_data as $t_galeri)
            {
                ?>
                <tr>
			<td width="80px"><?php echo ++$start ?></td>
			<td><?php echo $t_galeri->id_pernikahan ?></td>
			<td><?php echo $t_galeri->nama_foto ?></td>
			<td><?php echo $t_galeri->judul ?></td>
			<td style="text-align:center" width="200px">
				<?php 
				echo anchor(site_url('admin/t_galeri/read/'.$t_galeri->id),'Read'); 
				echo ' | '; 
				echo anchor(site_url('admin/t_galeri/update/'.$t_galeri->id),'Update'); 
				echo ' | '; 
				echo anchor(site_url('admin/t_galeri/delete/'.$t_galeri->id),'Delete','onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
				?>
			</td>
		</tr>
                <?php
            }
            ?>
        </table>
        <div class="row">
            <div class="col-md-6">
                <a href="#" class="btn btn-primary">Total Record : <?php echo $total_rows ?></a>
	    </div>
            <div class="col-md-6 text-right">
                <?php echo $pagination ?>
            </div>
        </div>