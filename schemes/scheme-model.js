const knex = require('knex');

const db = knex({
	client           : 'sqlite3',
	connection       : {
		filename : './data/schemes.db3',
	},
	useNullAsDefault : true,
});

module.exports = {
	find,
	findById,
	findSteps,
	add,
	update,
	remove,
};

function find() {
	return db('schemes');
}

function findById(id) {
	return db('schemes').where({ id }).first();
}

function findSteps(id) {
	return db('steps')
		.select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
		.join('schemes', 'steps.scheme_id', 'schemes.id')
		.where('schemes.id', id)
		.orderBy('steps.step_number', 'asc');
}

function add(schemes) {
	return db('schemes').insert(schemes, 'id').then((ids) => {
		[ id ] = ids;
		return findById(id);
	});
}

function update(changes, id) {
	return db('schemes').update(changes).where({ id }).then(() => {
		return findById(id);
	});
}

function remove(id) {
	return db('schemes').del().where({ id });
}
