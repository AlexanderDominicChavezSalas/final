import { Model, DataTypes } from 'sequelize';

const SENSOR_TABLE = 'sensor';

class Sensor extends Model {
    static config(sequelize) {
        return {
            sequelize,
            tableName: SENSOR_TABLE,
            modelName: 'Sensor',
            timestamps: false
        };
    }
}

const SensorSchema = {
    id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
    },
    ts: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'ts'
    },
    co: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'co'
    },
    humidity: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'humidity'
    },
    lpg: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'lpg'
    },
    smoke: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'motion'
    },
    temp: {
        allowNull: false,
        type: DataTypes.DOUBLE,
        field: 'temp'
    }
};

export { Sensor, SensorSchema };