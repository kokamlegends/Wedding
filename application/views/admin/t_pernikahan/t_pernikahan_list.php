<div class="row" style="margin-bottom: 10px">
            <div class="col-md-4">
                <?php echo anchor(site_url('admin/t_pernikahan/create'),'Create', 'class="btn btn-primary"'); ?>
            </div>
            <div class="col-md-4 text-center">
                <div style="margin-top: 8px" id="message">
                    <?php echo $this->session->userdata('message') <> '' ? $this->session->userdata('message') : ''; ?>
                </div>
            </div>
            <div class="col-md-1 text-right">
            </div>
            <div class="col-md-3 text-right">
                <form action="<?php echo site_url('admin/t_pernikahan/index'); ?>" class="form-inline" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="q" value="<?php echo $q; ?>">
                        <span class="input-group-btn">
                            <?php 
                                if ($q <> '')
                                {
                                    ?>
                                    <a href="<?php echo site_url('admin/t_pernikahan'); ?>" class="btn btn-default">Reset</a>
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
		<th>Nama Lengkap P</th>
		<th>Nama Panggilan P</th>
		<th>Nama Lengkap W</th>
		<th>Nama Panggilan W</th>
		<th>Tanggal Pernikahan</th>
		<th>Alamat Pernikahan</th>
		<th>Waktu Mulai</th>
		<th>Waktu Selesai</th>
		<th>Id User</th>
		<th>Status</th>
		<th>Action</th>
            </tr><?php
            foreach ($t_pernikahan_data as $t_pernikahan)
            {
                ?>
                <tr>
			<td width="80px"><?php echo ++$start ?></td>
			<td><?php echo $t_pernikahan->nama_lengkap_p ?></td>
			<td><?php echo $t_pernikahan->nama_panggilan_p ?></td>
			<td><?php echo $t_pernikahan->nama_lengkap_w ?></td>
			<td><?php echo $t_pernikahan->nama_panggilan_w ?></td>
			<td><?php echo $t_pernikahan->tanggal_pernikahan ?></td>
			<td><?php echo $t_pernikahan->alamat_pernikahan ?></td>
			<td><?php echo $t_pernikahan->waktu_mulai ?></td>
			<td><?php echo $t_pernikahan->waktu_selesai ?></td>
			<td><?php echo $t_pernikahan->id_user ?></td>
			<td><?php echo $t_pernikahan->status ?></td>
			<td style="text-align:center" width="200px">
				<?php 
				echo anchor(site_url('admin/t_pernikahan/read/'.$t_pernikahan->id),'Read'); 
				echo ' | '; 
				echo anchor(site_url('admin/t_pernikahan/update/'.$t_pernikahan->id),'Update'); 
				echo ' | '; 
				echo anchor(site_url('admin/t_pernikahan/delete/'.$t_pernikahan->id),'Delete','onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
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